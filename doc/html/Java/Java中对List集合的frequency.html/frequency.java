package com.mchz.portvision.others;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import cn.hutool.core.date.DateUtil;
import org.junit.Assert;
import org.junit.Test;

/**
 * @author: Elijah
 * @Date: 2018/7/16
 * @Time: 14:11
 * @Description: other
 * @modified:
 */
public class OtherTest {

    @Test
    public void testCase4() {
        List<String> list = new ArrayList<>();
        List<String> distinctList = new ArrayList<>();
        list.add("2");
        list.add("1");
        list.add("3");
        list.add("1");
        list.add("2");

        int maxCount = 0;
        String maxValue = null;
        for (String s : list) {
            int count = Collections.frequency(list, s);

            if (count > maxCount) {
                maxCount = count;
                maxValue = s;
            }

            if (Collections.frequency(distinctList, s) < 1) {
                distinctList.add(s);
            }
        }
        Assert.assertEquals("2", maxValue);
        Assert.assertEquals(3, distinctList.size());
    }
}
