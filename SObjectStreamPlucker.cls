public class SObjectStreamPlucker {

    SObjectStream stream;
    Schema.SObjectField field;

    private SObjectStreamPlucker() {}

    public SObjectStreamPlucker( SObjectStream stream, Schema.SObjectField field ) {

        this.stream = stream;
        this.field = field;

    }
    
    public Collection collect() {
        return new Collection ( pluckField() );
    }

    private List<Object> pluckField () {

        List<Object> pluckedFields = new List<Object> ();

        for ( SObject record : this.stream.getRecords() ) {

            if ( record.get( this.field ) == null ) continue;

            pluckedFields.add( record.get( this.field ) );
            
        }

        return pluckedFields;

    }

}
