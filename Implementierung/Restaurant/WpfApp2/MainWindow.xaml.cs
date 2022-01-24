using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
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

namespace WpfApp2
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Restaurant_BestellungenEntities ctx = new Restaurant_BestellungenEntities();
        public MainWindow()
        {
            InitializeComponent();
        }


        private void Button_ZumHauptmenü(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Visible;
            MainGrid_SpeisekarteVerwalten.Visibility = Visibility.Hidden;
        }

        private void Button_SpeisekarteVerwalten(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Hidden;
            MainGrid_SpeisekarteVerwalten.Visibility = Visibility.Visible;
            Speisekarte_Laden();
        }

        private void Speisekarte_Laden()
        {
            ctx.Speise.Load();
            MainGrid_SpeisekarteVerwalten.DataContext = ctx.Speise.ToList();
        }
        private void Button_DeleteCurrentItem(object sender, RoutedEventArgs e)
        {
            int id = (int)AusgewähltesProdukt_ID.Content;
            Speise s = ctx.Speise.Where(x => x.Produkt_ID == id).FirstOrDefault();
            ctx.Speise.Remove(s);
            ctx.SaveChanges();
            MainGrid_SpeisekarteVerwalten.DataContext = null;
            MainGrid_SpeisekarteVerwalten.DataContext = ctx.Speise.ToList();
        }
        private void Button_SaveChanges(object sender, RoutedEventArgs e)
        {
            Speise NeueSpeise = (Speise)dataGrid.Items.GetItemAt(dataGrid.Columns.Count() - 1);
            ctx.Speise.Add(NeueSpeise);
            ctx.SaveChanges();
            MainGrid_SpeisekarteVerwalten.DataContext = null;
            MainGrid_SpeisekarteVerwalten.DataContext = ctx.Speise.ToList();
        }

        private void Button_RechnungErstellen(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Hidden;
            //...
        }
        private void Button_Rechnungsübersicht(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Hidden;
            //...
        }

        private void Button_Github(object sender, RoutedEventArgs e)
        {
            Process.Start("https://github.com/Gruppe4-Restaurant/Restaurant-Bestellungen");
        }

    }
}
