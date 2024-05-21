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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Notes_Program.PageBased;
using Notes_Program.BasedWindow;
using Notes_Program.Model;

namespace Notes_Program.PageBased
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void Click_Auth(object sender, RoutedEventArgs e)
        {
            using (var db = new NotesDBEntities())
            {
                var login = db.User.AsNoTracking().FirstOrDefault(l => l.Login == TxbLogin.Text & l.Password == TxbPassword.Password);
                if (login == null)
                {
                    MessageBox.Show("Неверный Логин или Пароль!");
                }
                else
                {
                    if (login.id_Role == 1)
                    {
                        NotesWindow notes = new NotesWindow();
                        notes.Show();
                        Application.Current.MainWindow.Close();
                        MessageBox.Show("\nЛогин: " + login.Login +
                            "\nДолжность: Администратор", "Данные Пользователя");
                    }
                    else if (login.id_Role == 2)
                    {
                        NotesWindow notes = new NotesWindow();
                        notes.Show();
                        Application.Current.MainWindow.Close();
                        MessageBox.Show("\nЛогин: " + login.Login +
                            "\nДолжность: Пользователь", "Данные Пользователя");
                    }
                }

            }
        }

        private void Click_Reg(object sender, RoutedEventArgs e)
        {
            RegPage pageReg = new RegPage();
            this.NavigationService.Navigate(pageReg);
        }
    }
}
