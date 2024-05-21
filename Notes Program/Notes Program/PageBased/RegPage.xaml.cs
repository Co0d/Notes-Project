using Notes_Program.Model;
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

namespace Notes_Program.PageBased
{
    /// <summary>
    /// Логика взаимодействия для RegPage.xaml
    /// </summary>
    public partial class RegPage : Page
    {
        public RegPage()
        {
            InitializeComponent();
        }

        private void Click_Reg(object sender, RoutedEventArgs e)
        {
            var userinfo = NotesDBEntities.GetContext().User.FirstOrDefault(l => l.Login == TxbLogin.Text);

            if (userinfo != null)
            {
                MessageBox.Show("Такой Логин уже существует!", "Уведомление");
                TxbLogin.Clear();
            }
            else if (TxbLogin.Text == "" || TxbPassword.Password == ""
                || TxbName.Text == "")
            {
                MessageBox.Show("Вы не заполнили поля", "Уведомление");
            }
            else
            {
                User user = new User();
                user.Login = TxbLogin.Text.ToString();
                user.Password = TxbPassword.Password.ToString();
                user.FullName = TxbName.Text.ToString();
                user.id_Role = 2;
                NotesDBEntities.GetContext().User.Add(user);
                NotesDBEntities.GetContext().SaveChanges();
                MessageBox.Show("Пользователь был добавлен в базу! Теперь вы можете войти!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                AuthPage authReg = new AuthPage();
                this.NavigationService.Navigate(authReg);
            }
        }

        private void Click_Back(object sender, RoutedEventArgs e)
        {
            AuthPage authReg = new AuthPage();
            this.NavigationService.Navigate(authReg);
        }
    }
}
