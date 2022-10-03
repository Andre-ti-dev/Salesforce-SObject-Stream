public class Collection {

    private List<Object> elements;

    private Collection () {}

    public Collection ( Set<Object> elements ) {
        this ( new List<Object> ( elements ) );
    }

    public Collection ( List<Object> elements ) {
        this.elements = removeNulls ( elements );
    }

    private List<Object> removeNulls ( List<Object> elements ) {

        List<Object> notNullElements = new List<Object> ();

        for ( Object element : elements ) {

            if ( element == null ) continue;

            notNullElements.add( element );
            
        }

        return notNullElements;

    }

    public List<Object> asObjectList() {
        
        return this.elements;

    }

    public Set<Object> asObjectSet() {
        return new Set<Object> ( asObjectList() );
    }

    public List<SObject> asSObjectList() {
        
        List<SObject> SObjects = new List<SObject> ();

        for ( Object value : this.elements ) {

            SObjects.add( ( SObject ) value );
            
        }

        return SObjects;

    }

    public Set<SObject> asSObjectSet() {
        return new Set<SObject> ( asSObjectList() );
    }

    public List<Datetime> asDatetimeList() {
        
        List<Datetime> dateTimes = new List<Datetime> ();

        for ( Object value : this.elements ) {

            dateTimes.add( ( Datetime ) value );
            
        }

        return dateTimes;

    }

    public Set<Datetime> asDatetimeSet() {
        return new Set<Datetime> ( asDatetimeList() );
    }

    public List<Time> asTimeList() {
        
        List<Time> times = new List<Time> ();

        for ( Object value : this.elements ) {

            times.add( ( Time ) value );
            
        }

        return times;

    }

    public Set<Time> asTimeSet() {
        return new Set<Time> ( asTimeList() );
    }

    public List<Date> asDateList() {
        
        List<Date> dates = new List<Date> ();

        for ( Object value : this.elements ) {

            dates.add( ( Date ) value );
            
        }

        return dates;

    }

    public Set<Date> asDateSet() {
        return new Set<Date> ( asDateList() );
    }

    public List<Id> asIdList() {
        
        List<Id> ids = new List<Id> ();

        for ( Object value : this.elements ) {

            ids.add( ( Id ) value );
            
        }

        return ids;

    }

    public Set<Id> asIdSet() {
        return new Set<Id> ( asIdList() );
    }

    public List<String> asStringList() {
        
        List<String> strings = new List<String> ();

        for ( Object value : this.elements ) {

            strings.add( ( String ) value );
            
        }

        return strings;

    }

    public Set<String> asStringSet() {
        return new Set<String> ( asStringList() );
    }

    public List<Long> asLongList() {
        
        List<Long> longs = new List<Long> ();

        for ( Object value : this.elements ) {

            longs.add( ( Long ) value );
            
        }

        return longs;

    }

    public Set<Long> asLongSet() {
        return new Set<Long> ( asLongList() );
    }

    public List<Integer> asIntegerList() {
        
        List<Integer> integers = new List<Integer> ();

        for ( Object value : this.elements ) {

            integers.add( ( Integer ) value );
            
        }

        return integers;

    }

    public Set<Integer> asIntegerSet() {
        return new Set<Integer> ( asIntegerList() );
    }

    public List<Double> asDoubleList() {
        
        List<Double> doubles = new List<Double> ();

        for ( Object value : this.elements ) {

            doubles.add( ( Double ) value );
            
        }

        return doubles;

    }

    public Set<Double> asDoubleSet() {
        return new Set<Double> ( asDoubleList() );
    }

    public List<Decimal> asDecimalList() {
        
        List<Decimal> decimals = new List<Decimal> ();

        for ( Object value : this.elements ) {

            decimals.add( ( Decimal ) value );
            
        }

        return decimals;

    }

    public Set<Decimal> asDecimalSet() {
        return new Set<Decimal> ( asDecimalList() );
    }

    public List<Boolean> asBooleanList() {
        
        List<Boolean> booleans = new List<Boolean> ();

        for ( Object value : this.elements ) {

            booleans.add( ( Boolean ) value );
            
        }

        return booleans;

    }

    public Set<Boolean> asBooleanSet() {
        return new Set<Boolean> ( asBooleanList() );
    }

}
