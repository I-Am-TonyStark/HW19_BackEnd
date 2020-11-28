package com.mamalimomen.base.utilities;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public interface Regex {
    Pattern description = Pattern.compile("[\\w\\.\\s,&]*", Pattern.CASE_INSENSITIVE);
    Pattern medicineName = Pattern.compile("\\w{3,}", Pattern.CASE_INSENSITIVE);
    Pattern personName = Pattern.compile("[a-zA-Z]{3,}", Pattern.CASE_INSENSITIVE);

    static boolean matches(Pattern pattern, String string) {
        Matcher matcher = pattern.matcher(string);
        return matcher.matches();
    }
}
