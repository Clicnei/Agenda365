package utils;

import java.util.Calendar;

/**
 * @author Volnei
 */
public class ConversorData {
    public static java.sql.Date conv(Calendar d){
       java.sql.Date data = new java.sql.Date(d.getTime().getTime());
       return data;
    }
}
