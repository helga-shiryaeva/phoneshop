package com.es.phoneshop.web.service;

import com.es.core.model.phone.OrderEnum;
import com.es.core.model.phone.Phone;
import com.es.core.model.phone.PhoneDao;
import com.es.phoneshop.web.bean.pagination.CurrentPhonePage;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductListPageService {
    private static final int AMOUNT_OF_PHONES_ON_PAGE = 10;
    private static final int AMOUNT_OF_ACCESSIBLE_PAGES_ON_LINE = 5;

    @Resource
    private PhoneDao phoneDao;

    public CurrentPhonePage getCurrentPage(OrderEnum order, String searchQueryString, int currentPageNumber) {
        Long totalCount = phoneDao.getPhonesCountByQuery(searchQueryString);
        Integer firstShownPageNumber = currentPageNumber - AMOUNT_OF_ACCESSIBLE_PAGES_ON_LINE / 2;
        if(firstShownPageNumber <= 0)
            firstShownPageNumber = 1;
        Integer lastPageNumber = (int)Math.ceil(totalCount / AMOUNT_OF_PHONES_ON_PAGE) + 1;
        Integer lastShownPageNumber = firstShownPageNumber == 1 ?
                AMOUNT_OF_ACCESSIBLE_PAGES_ON_LINE : currentPageNumber + AMOUNT_OF_ACCESSIBLE_PAGES_ON_LINE / 2;
        if(lastShownPageNumber > lastPageNumber)
            lastShownPageNumber = lastPageNumber;
        List<Phone> currentPagePhoneList = getPhoneListByCurrentPageIndex(order, searchQueryString, currentPageNumber, totalCount);
        return new CurrentPhonePage(
                totalCount,
                firstShownPageNumber,
                lastShownPageNumber,
                lastPageNumber,
                currentPageNumber,
                currentPagePhoneList
        );
    }

    private List<Phone> getPhoneListByCurrentPageIndex(OrderEnum order, String searchQueryString, int currentPageNumber, Long totalCount) {
        int offset = AMOUNT_OF_PHONES_ON_PAGE * (currentPageNumber - 1);
        int limit = AMOUNT_OF_PHONES_ON_PAGE;
        if(limit + offset < totalCount)
            return phoneDao.findAllInOrder(offset, limit, order, searchQueryString).subList(0, AMOUNT_OF_PHONES_ON_PAGE);
        else if(totalCount == 0)
            return new ArrayList<>();
        return phoneDao.findAllInOrder(offset, 0 ,order, searchQueryString);
    }
}
