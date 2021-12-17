using System;

namespace Alistirma
{
    class Program
    {
        static string kelime, tekrar;
        static int i, nokta = 0;

        static void Main(string[] args)
        {
            Console.Write("Bir kelime giriniz: ");
            kelime = Console.ReadLine();

            MetinTespiti(kelime);
        }

        static void MetinTespiti(string str)
        {
            if (str[0] == '0')
            {
                for (i = 1; i < str.Length; i++)
                {
                    if (str[i] == '0' || str[i] == '1' || str[i] == '2' || str[i] == '3' || str[i] == '4' || str[i] == '5' || str[i] == '6' || str[i] == '7' || str[i] == '8' || str[i] == '9' || str[i] == '.')
                    {
                        if (str[i] == '.')
                        {
                            nokta++;
                        }
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                if (i == str.Length && str.Contains('.') == false)
                {
                    Console.WriteLine("Kelime TAM SAYI bir kelimedir.");
                }
                else if (i == str.Length && str.Contains('.') == true && nokta == 1)
                {
                    Console.WriteLine("Kelime ONDALIKLI SAYI bir kelimedir.");
                }
                else
                {
                    Console.WriteLine("Girilen kelime ondalıklı bir sayı veya tam sayı değildir!");
                }
            }
            else if (str[0] == '-' || str[0] == '+' || str[0] == '1' || str[0] == '2' || str[0] == '3' || str[0] == '4' || str[0] == '5' || str[0] == '6' || str[0] == '7' || str[0] == '8' || str[0] == '9')
            {
                for (i = 1; i < str.Length; i++)
                {
                    if (str[i] == '0' || str[i] == '1' || str[i] == '2' || str[i] == '3' || str[i] == '4' || str[i] == '5' || str[i] == '6' || str[i] == '7' || str[i] == '8' || str[i] == '9' || str[i] == '.')
                    {
                        if (str[i] == '.')
                        {
                            nokta++;
                        }
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                if (i == str.Length && str.Contains('.') == false)
                {
                    Console.WriteLine("Kelime TAM SAYI bir kelimedir.");
                }
                else if (i == str.Length && str.Contains('.') == true && nokta == 1)
                {
                    Console.WriteLine("Kelime ONDALIKLI SAYI bir kelimedir.");
                }
                else
                {
                    Console.WriteLine("Girilen kelime ondalıklı bir sayı veya tam sayı değildir!");
                }
            }
            else
            {
                Console.WriteLine("Girilen kelime ondalıklı bir sayı veya tamsayı değildir!");
            }
            Console.WriteLine();
            Console.Write("Tekrar denemek ister misiniz? E / H ");
            tekrar = Console.ReadLine();
            if (tekrar == "e" || tekrar == "E")
            {
                nokta = 0;
                Main(null);
            }
        }
    }
}
