/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

/**
 *
 * @author DucNM
 */
public class MailUtil {
    
    public static String emailGenerator(String lastId, String prefixId) {
        int nextId = Integer.parseInt(lastId.substring(prefixId.length(), lastId.length())) + 1;
        int lengthNumberId = lastId.length() - prefixId.length();
        String zeroNumber = "";
        for (int i = 1; i <= lengthNumberId; i++) {
            if (nextId < Math.pow(10, i))
            {
                for (int j = 1; j <= lengthNumberId - i; i++)
                {
                    zeroNumber += "0";
                }
            }
        }
        return prefixId + zeroNumber + nextId;
    }
    
}
