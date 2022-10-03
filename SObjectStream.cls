public class SObjectStream {
    
    private Collection records;

    private SObjectStream () { }

    private SObjectStream ( List<SObject> records ) {
        this.records = new Collection ( records );
    }

    public static SObjectStream of ( List<SObject> records ) {
        return new SObjectStream( records );
    }

    public static SObjectStream of ( Set<SObject> records ) {
        return SObjectStream.of ( new List<SObject> ( records ) );
    }

    public List<SObject> getRecords () {
        return this.records.asSObjectList();
    }

    public SObjectStreamFilter filter ( Schema.SObjectField field ) {
        return new SObjectStreamFilter ( this, field );
    }

    public SObjectStreamPlucker pluck ( Schema.SObjectField field ) {
        return new SObjectStreamPlucker ( this, field );
    }

    public SObjectStreamAggregator groupBy ( Schema.SObjectField field ) {
        return new SObjectStreamAggregator ( this, field );
    }

    public SObjectStreamIndexer indexBy ( Schema.SObjectField field ) {
        return new SObjectStreamIndexer ( this, field );
    }
    
}
