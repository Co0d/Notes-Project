using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Xml.Linq;
using Notes_Program.Model;

namespace Notes_Program.BasedWindow
{
    /// <summary>
    /// Логика взаимодействия для Notes.xaml
    /// </summary>
    public partial class NotesWindow : Window
    {
        public NotesWindow()
        {
            InitializeComponent();

            WindowState = WindowState.Maximized;

            var Order = NotesDBEntities.GetContext().Notes.ToList();
            ViewNotes.ItemsSource = Order;
        }

        private void UpDateTable()
        {
            var User = NotesDBEntities.GetContext().Notes.ToList();

            User = User.Where(x => x.Heading.ToLower().Contains(TxbSearch.Text.ToLower())).ToList();

            ViewNotes.ItemsSource = NotesDBEntities.GetContext().Notes.ToList();

            ViewNotes.ItemsSource = User;
        }

        private void ViewNotes_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var CurrentUser = ViewNotes.SelectedItem as Notes;

            if (CurrentUser != null)
            {
                TxbHeading.Text = CurrentUser.Heading;
                TxbText.Text = CurrentUser.Text;
            }
        }

        private void Click_Add(object sender, RoutedEventArgs e)
        {
            var CurrentUser = ViewNotes.SelectedItem as Notes;
            if(CurrentUser != null)
            {
                MessageBox.Show("Вы не можете добавить данные из списка заметок!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                TxbHeading.Clear();
                TxbText.Clear(); 
                ViewNotes.SelectedIndex = -1;
            }
            else
            {
                if (MessageBox.Show("Вы точно хотите добавить заметку?", "Уведомление", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    Notes notes = new Notes();
                    notes.Heading = TxbHeading.Text;
                    notes.Text = TxbText.Text;
                    NotesDBEntities.GetContext().Notes.Add(notes);
                    try
                    {
                        NotesDBEntities.GetContext().SaveChanges();
                        UpDateTable();
                        TxbHeading.Clear();
                        TxbText.Clear();
                        TxbSearch.Clear();
                        MessageBox.Show("Заметка добавлена!");
                    }
                    catch
                    {
                        MessageBox.Show("Произошла ошибка! Пустые поля!", "Ошибка");
                    }
                }
            }
        }

        private void Click_Edit(object sender, RoutedEventArgs e)
        {
            var notes = ViewNotes.SelectedItem as Notes;
            if (notes != null)
            {
                if (MessageBox.Show("Вы точно хотите изменить данные?", "Уведомление", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    notes.Heading = TxbHeading.Text;
                    notes.Text = TxbText.Text;
                    TxbHeading.Clear();
                    TxbText.Clear();
                    TxbSearch.Clear();
                    ViewNotes.SelectedIndex = -1;
                    NotesDBEntities.GetContext().SaveChanges();
                    UpDateTable();
                }
            }
            else
            {
                MessageBox.Show("Не выбран элемент!", "Ошибка");
            }
        }

        private void Click_Del(object sender, RoutedEventArgs e)
        {
            var notes = ViewNotes.SelectedItem as Notes;
            if (notes != null)
            {
                if (MessageBox.Show("Вы действительно хотите удалить данные?", "Уведомление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    NotesDBEntities.GetContext().Notes.Remove(notes);
                    NotesDBEntities.GetContext().SaveChanges();
                    UpDateTable();
                    TxbHeading.Clear();
                    TxbText.Clear();
                    TxbSearch.Clear();
                    MessageBox.Show("Удалено");
                }
            }
            else if (notes == null)
            {
                MessageBox.Show("Не выбран элемент!", "Ошибка");
            }
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpDateTable();
        }
    }
}
