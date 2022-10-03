public class SObjectStreamAggregator {

    SObjectStream stream;
    Schema.SObjectField field;
    
    private SObjectStreamAggregator () {}

    public SObjectStreamAggregator ( SObjectStream stream, Schema.SObjectField field ) {
        this.stream = stream;
        this.field = field;
    }

    public Map<Object, List<SObject>> withObjectKey () {

        return group();

    }

    public Map<Id, List<SObject>> withIdKey () {

        Map<Id, List<SObject>> groupedRecordsById = new Map<Id, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsById.put( (Id) key, groupedRecords.get( key ) );

        }

        return groupedRecordsById;

    }

    public Map<Boolean, List<SObject>> withBooleanKey () {

        Map<Boolean, List<SObject>> groupedRecordsByBoolean = new Map<Boolean, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByBoolean.put( (Boolean) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByBoolean;

    }

    public Map<String, List<SObject>> withStringKey () {

        Map<String, List<SObject>> groupedRecordsByString = new Map<String, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByString.put( (String) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByString;

    }

    public Map<Integer, List<SObject>> withIntegerKey () {

        Map<Integer, List<SObject>> groupedRecordsByInteger = new Map<Integer, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByInteger.put( (Integer) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByInteger;

    }

    public Map<Long, List<SObject>> withLongKey () {

        Map<Long, List<SObject>> groupedRecordsByLong = new Map<Long, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByLong.put( (Long) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByLong;

    }

    public Map<Double, List<SObject>> withDoubleKey () {

        Map<Double, List<SObject>> groupedRecordsByDouble = new Map<Double, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByDouble.put( (Double) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByDouble;

    }

    public Map<Date, List<SObject>> withDateKey () {

        Map<Date, List<SObject>> groupedRecordsByDate = new Map<Date, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByDate.put( (Date) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByDate;

    }

    public Map<Time, List<SObject>> withTimeKey () {

        Map<Time, List<SObject>> groupedRecordsByTime = new Map<Time, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByTime.put( (Time) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByTime;

    }

    public Map<Datetime, List<SObject>> withDatetimeKey () {

        Map<Datetime, List<SObject>> groupedRecordsByDatetime = new Map<Datetime, List<SObject>> ();
        Map<Object, List<SObject>> groupedRecords = group();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByDatetime.put( (Datetime) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByDatetime;

    }

    private Map<Object, List<SObject>> group () {

        Map<Object, List<SObject>> groupedRecords = new Map<Object, List<SObject>> ();

        for ( SObject record : this.stream.getRecords() ) {

            if ( ! ( groupedRecords.containsKey( record.get( this.field ) ) ) ) { 
                groupedRecords.put( record.get( this.field ), new List<SObject> ());
            }

            groupedRecords.get( record.get( this.field ) ).add( record );

        }

        return groupedRecords;

    }

}
