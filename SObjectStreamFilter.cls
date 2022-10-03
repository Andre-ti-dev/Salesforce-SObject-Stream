public class SObjectStreamFilter {

    SObjectStream stream;
    Schema.SObjectField field;

    private SObjectStreamFilter () {}

    public SObjectStreamFilter ( SObjectStream stream, Schema.SObjectField field ) {

        this.stream = stream;
        this.field = field;

    }

    public SObjectStream equals ( Object value ) {
        return filter(DynamicComparatorResult.EQUALS, value);
    }

    public SObjectStream notEquals ( Object value ) {
        return filter(DynamicComparatorResult.NOT_EQUALS, value);
    }

    public SObjectStream greatherThan ( Object value ) {
        return filter( DynamicComparatorResult.GREATER_THAN, value );
    }

    public SObjectStream lessThan ( Object value ) {
        return filter( DynamicComparatorResult.LESS_THAN, value );
    }

    public SObjectStream greatherThanOrEquals ( Object value ) {
        return filter( DynamicComparatorResult.GREATER_THAN, value );
    }

    public SObjectStream isIn ( Set<Object> values ) {
        return isIn( new List<Object> ( values ) );
    }

    public SObjectStream isIn ( List<Object> values ) {
        return filter( DynamicComparatorResult.IS_IN, values );
    }

    public SObjectStream notIn ( Set<Object> values ) {
        return notIn( new List<Object> ( values ) );
    }

    public SObjectStream notIn ( List<Object> values ) {
        return filter( DynamicComparatorResult.NOT_IN, values );
    }

    public SObjectStream hasChanged ( List<SObject> oldRecords ) {
        return hasChanged ( new Map<Id, SObject> ( oldRecords ) );
    }

    public SObjectStream hasChanged ( Map<Id, SObject> oldRecords ) {
        return filter(DynamicComparatorResult.NOT_EQUALS, oldRecords);
    }

    private SObjectStream filter ( DynamicComparatorResult comparatorResult, Object valueToCompare ) {
        
        List<SObject> filteredRecords = new List<SObject> ();
        Map<Id, SObject> oldRecords = new Map<Id, SObject> ();

        if ( valueToCompare instanceOf Map<Id, SObject> ) oldRecords.putAll( (Map<Id, SObject>) valueToCompare);

        for ( SObject record : this.stream.getRecords() ) {

            if ( ! oldRecords.isEmpty() ) valueToCompare = oldRecords.get( record.Id )?.get( this.field );

            if ( DynamicComparator.compare ( record.get( this.field ), valueToCompare ) != comparatorResult ) continue;

            filteredRecords.add ( record );

        }

        return SObjectStream.of ( filteredRecords );

    }

}
