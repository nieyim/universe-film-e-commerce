using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace Project.Models
{
    public class Encrypt
    {
        public static string passEncrypt (string pass)
        {
            using (SHA512 a = SHA512.Create())
            {
                byte[] toByteArray = Encoding.UTF8.GetBytes(pass); //conver text to Byte Array
                byte[] hashByteArray = a.ComputeHash(toByteArray); // hash Byte Array to store in another Byte Array
                return BitConverter.ToString(hashByteArray); // chuyển Byte Array về String
            }
        }
    }
}