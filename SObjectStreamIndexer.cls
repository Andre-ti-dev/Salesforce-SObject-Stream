public class SObjectStreamIndexer {

    SObjectStream stream;
    Schema.SObjectField field;

    private SObjectStreamIndexer () {}

    public SObjectStreamIndexer ( SObjectStream stream, Schema.SObjectField field ) {
        this.stream = stream;
        this.field = field;
    }

    public Map<Object, SObject> withObjectKey () {

        return index();

    }

    public Map<Id, SObject> withIdKey () {

        Map<Id, SObject> groupedRecordsById = ( Map<Id, SObject> ) getMapType('Id').newInstance();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsById.put( (Id) key, groupedRecords.get( key ) );

        }

        return groupedRecordsById;

    }

    public Map<Boolean, SObject> withBooleanKey () {

        Map<Boolean, SObject> groupedRecordsByBoolean = new Map<Boolean, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByBoolean.put( (Boolean) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByBoolean;

    }

    public Map<String, SObject> withStringKey () {

        Map<String, SObject> groupedRecordsByString = new Map<String, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByString.put( (String) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByString;

    }

    public Map<Integer, SObject> withIntegerKey () {

        Map<Integer, SObject> groupedRecordsByInteger = new Map<Integer, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByInteger.put( (Integer) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByInteger;

    }

    public Map<Long, SObject> withLongKey () {

        Map<Long, SObject> groupedRecordsByLong = new Map<Long, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByLong.put( (Long) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByLong;

    }

    public Map<Double, SObject> withDoubleKey () {

        Map<Double, SObject> groupedRecordsByDouble = new Map<Double, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByDouble.put( (Double) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByDouble;

    }

    public Map<Date, SObject> withDateKey () {

        Map<Date, SObject> groupedRecordsByDate = new Map<Date, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByDate.put( (Date) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByDate;

    }

    public Map<Time, SObject> withTimeKey () {

        Map<Time, SObject> groupedRecordsByTime = new Map<Time, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByTime.put( (Time) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByTime;

    }

    public Map<Datetime, SObject> withDatetimeKey () {

        Map<Datetime, SObject> groupedRecordsByDatetime = new Map<Datetime, SObject> ();
        Map<Object, SObject> groupedRecords = index();

        for ( Object key : groupedRecords.keySet() ) {

            groupedRecordsByDatetime.put( (Datetime) key, groupedRecords.get( key ) );

        }

        return groupedRecordsByDatetime;

    }

    private Map<Object, SObject> index () {

        Map<Object, SObject> indexedRecords = new Map<Object, SObject> ();

        for ( SObject record : this.stream.getRecords() ) {

            if ( record.get( this.field ) == null ) continue;

            indexedRecords.put( record.get( this.field ), record );

        }

        return indexedRecords;

    }

    // Only for allow casting  
    private Type getMapType ( String keyType ) {

        String SObjectType = 'SObject';

        SObject record = this.stream.getRecords().get(0);

        if ( record != null ) SObjectType = record.getSObjectType().getDescribe().getName();

        return Type.forName( 'Map<' + keyType + ', ' + SObjectType + '>');

    }

}
