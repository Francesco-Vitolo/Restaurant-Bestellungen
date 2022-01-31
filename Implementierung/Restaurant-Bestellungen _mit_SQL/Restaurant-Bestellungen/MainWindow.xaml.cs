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

namespace Restaurant_Bestellungen
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        List<Rechnung_element> Rechnungspositionen;
        private Restaurant_BestellungenEntities ctx = new Restaurant_BestellungenEntities();

        public MainWindow()
        {
            InitializeComponent();
            MainGrid_SpeisekarteVerwalten.Visibility = Visibility.Hidden;
            MainGrid_Rechnungsübersicht.Visibility = Visibility.Hidden;
        }

        private void Button_ZumHauptmenü(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Visible;
            MainGrid_SpeisekarteVerwalten.Visibility = Visibility.Hidden;
            MainGrid_Rechnungsübersicht.Visibility = Visibility.Hidden;
        }

        private void Button_RechnungErstellen(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Hidden;
            //...
        }
        private void Button_Github(object sender, RoutedEventArgs e)
        {
            Process.Start("https://github.com/Gruppe4-Restaurant/Restaurant-Bestellungen");
        }




        private void Button_SpeisekarteVerwalten(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Hidden;
            MainGrid_SpeisekarteVerwalten.Visibility = Visibility.Visible;
            ctx.Speise.Load();
            MainGrid_SpeisekarteVerwalten.DataContext = ctx.Speise.ToList();
        }

        private void Button_DeleteCurrentItem(object sender, RoutedEventArgs e)
        {
            int id = (int)AusgewähltesProdukt_ID.Content; //Label (hidden)
            Speise s = ctx.Speise.Where(x => x.Produkt_ID == id).FirstOrDefault();

            if(ctx.Rechnung_element.All(x => x.Speise.Produkt_ID != s.Produkt_ID)) //überprüfen,ob Produkt schon in Rechnung vorhanden
            {
                ctx.Speise.Remove(s);
                ctx.SaveChanges();
                MainGrid_SpeisekarteVerwalten.DataContext = null;
                MainGrid_SpeisekarteVerwalten.DataContext = ctx.Speise.ToList();
            }
            else
            {
                MessageBox.Show("Produkt schon in Rechnung vorhanden.");
            }
        }
        private void Button_SaveChanges(object sender, RoutedEventArgs e)
        {
            if (AddBeschreibung.Text != "" && AddName.Text != "" && AddPreis.Text != "")
            {
                if(Decimal.TryParse(AddPreis.Text, out decimal result)) //Prüfen, ob Preis deicmal
                {
                    Speise NeueSpeise = new Speise();
                    NeueSpeise.Beschreibung = AddBeschreibung.Text;
                    NeueSpeise.Preis = Convert.ToDecimal(result);
                    NeueSpeise.Produkt_Name = AddName.Text;
                    //ctx.Speise.Count();
                    ctx.Speise.Add(NeueSpeise);
                    AddBeschreibung.Text = "";
                    AddName.Text = "";
                    AddPreis.Text = "";
                }
                else
                {
                    MessageBox.Show("Der eingegebe Wert muss eine Zahl sein");
                }
            }
            ctx.SaveChanges();
            MainGrid_SpeisekarteVerwalten.DataContext = null;
            MainGrid_SpeisekarteVerwalten.DataContext = ctx.Speise.ToList();
        }
  
        private void Button_Rechnungsübersicht(object sender, RoutedEventArgs e)
        {
            MainGrid_Menü.Visibility = Visibility.Hidden;
            MainGrid_Rechnungsübersicht.Visibility = Visibility.Visible;
            ctx.Rechnung.Load();
            Grid_Rechnungen.DataContext = ctx.Rechnung.ToList();
            //tb.Text = r.Rechnung_element.Count().ToString();
        }

        private void Grid_Rechnungen_MouseDown(object sender, MouseButtonEventArgs e)
        {
            decimal total = 0;
            Rechnung r = (Rechnung)Grid_Rechnungen.SelectedItem;
            Rechnungspositionen = ctx.Rechnung_element.Where(x => x.Rechnung_id == r.Rechnung_id).ToList();
            Grid_Rechnungselemente.DataContext = Rechnungspositionen.ToList();

            //Gesamt ausrechnen
            foreach(Rechnung_element pos in Rechnungspositionen)
            {
                total += pos.Speise.Preis * pos.Anzahl;
            }
            Total.Text = Convert.ToString(total);
        }

        private void Button_Status_ändern_Rechnungen(object sender, RoutedEventArgs e)
        {
            ctx.SaveChanges();
        }
    }
}
