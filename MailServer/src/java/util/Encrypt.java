/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import sun.misc.BASE64Encoder;

/**
 *
 * @author DucNM
 */
public class Encrypt {
    public String encrypt(String string) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte[] digest = md5.digest(string.getBytes());
        BASE64Encoder base64 = new BASE64Encoder();
        String encoded = base64.encode(digest);
        return encoded;
    }
}
