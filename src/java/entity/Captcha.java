/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Random;

/**
 *
 * @author songm
 */
public class Captcha
{

    public static String generate()
    {
        Random random = new Random();
        StringBuffer captchaStringBuffer = new StringBuffer();
        int length = 7;
        for (int i = 0; i < length; i++)
        {
            int baseCharNumber = Math.abs(random.nextInt()) % 62;
            int charNumber;
            //if base char number less than 26(uppercase letters) in ASCII code 
            if (baseCharNumber < 26)
            {
                //the number 65 is the first uppercase letter in ASCII code
                charNumber = 65 + baseCharNumber;
            } //if base char number less than 26(lowercase letters) in ASCII code 
            else if (baseCharNumber < 52)
            {
                //we need to minus the 26 uppercase letters 
                //the number 97 is the first lowercase letter in ASCII code
                charNumber = 97 + (baseCharNumber - 26);
            } //the last 10 digits 
            else
            {
                //we need to minus both 26(uppercase letters) + 26(lowercase letters) 
                //the number 48 is the first digit in ASCII code
                charNumber = 48 + (baseCharNumber - 52);
            }
            captchaStringBuffer.append((char) charNumber);
        }
        return captchaStringBuffer.toString();

    }
}
