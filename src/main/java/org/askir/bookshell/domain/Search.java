package org.askir.bookshell.domain;

public class Search {
    private String typeSearch;
    private String valueSearch;

    public String getTypeSearch() {
        return typeSearch;
    }

    public void setTypeSearch(String typeSearch) {
        this.typeSearch = typeSearch;
    }

    public String getValueSearch() {
        return valueSearch;
    }

    public void setValueSearch(String valueSearch) {
        this.valueSearch = valueSearch;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Search)) return false;

        Search search = (Search) o;

        if (typeSearch != null ? !typeSearch.equals(search.typeSearch) : search.typeSearch != null) return false;
        return !(valueSearch != null ? !valueSearch.equals(search.valueSearch) : search.valueSearch != null);

    }

    @Override
    public int hashCode() {
        int result = typeSearch != null ? typeSearch.hashCode() : 0;
        result = 31 * result + (valueSearch != null ? valueSearch.hashCode() : 0);
        return result;
    }
}
