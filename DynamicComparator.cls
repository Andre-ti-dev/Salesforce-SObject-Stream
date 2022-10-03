public with sharing class DynamicComparator {

    private static DynamicComparatorResult compareBooleans( Boolean first, Boolean second ) {

		return first == second ? DynamicComparatorResult.EQUALS : DynamicComparatorResult.NOT_EQUALS;

	}

	private static DynamicComparatorResult compareDates( Date first, Date second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;

		if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}

	private static DynamicComparatorResult compareTimes( Time first, Time second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;

		if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}

	private static DynamicComparatorResult compareDatetimes( Datetime first, Datetime second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;

		if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}

	private static DynamicComparatorResult compareDecimals( Decimal first, Decimal second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;
        
        if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}

	private static DynamicComparatorResult compareDoubles( Double first, Double second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;
        
        if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}	

	private static DynamicComparatorResult compareIds( Id first, Id second ) {

		return first == second ? DynamicComparatorResult.EQUALS : DynamicComparatorResult.NOT_EQUALS;

	}

	private static DynamicComparatorResult compareIntegers( Integer first, Integer second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;
        
        if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}

	private static DynamicComparatorResult compareLongs( Long first, Long second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;
        
        if ( first == second ) return DynamicComparatorResult.EQUALS;

		return DynamicComparatorResult.GREATER_THAN;

	}

	private static DynamicComparatorResult compareStrings( String first, String second ) {

		if ( first < second ) return DynamicComparatorResult.LESS_THAN;

		if ( first == second ) return DynamicComparatorResult.EQUALS;
        
        return DynamicComparatorResult.GREATER_THAN;

	}

    private static DynamicComparatorResult compareWithList ( Object value, List<Object> values ) {

        return values.contains(value) ? DynamicComparatorResult.IS_IN : DynamicComparatorResult.NOT_IN;

    } 

    private static DynamicComparatorResult compareObjects( Object first, Object second ) {

        return first == second ? DynamicComparatorResult.EQUALS : DynamicComparatorResult.NOT_EQUALS;

    }

	public static DynamicComparatorResult compare ( Object first, Object second ) {

		if ( first instanceof Boolean && second instanceof Boolean ) {

			return compareBooleans ( (Boolean) first, (Boolean) second );

		} else if ( first instanceof Decimal && second instanceof Decimal ) {

			return compareDecimals ( (Decimal) first, (Decimal) second );
            
		} else if ( first instanceof Double && second instanceof Double ) {

			return compareDoubles ( (Double) first, (Double) second );

		}  else if ( first instanceof Integer && second instanceof Integer ) {

			return compareIntegers ( (Integer) first, (Integer) second );

		} else if ( first instanceof Long && second instanceof Long ) {

			return compareLongs( (Long) first, (Long) second);

		} else if ( first instanceof String && second instanceof String ) {

			return compareStrings ( (String) first, (String) second );

		} else if ( first instanceof Id && second instanceof Id ) {

			return compareIds ( (Id) first, (Id) second );

		} else if ( first instanceof Date && second instanceof Date ) {

			return compareDates ( (Date) first, (Date) second );

		} else if ( first instanceof Time && second instanceof Time ) {

			return compareTimes ( (Time) first, (Time) second );

        } else if ( first instanceof Datetime && second instanceof Datetime ) {

			return compareDatetimes ( (Datetime) first, (Datetime) second );

		} else if (second instanceOf List<Object>) {

            return compareWithList ( first, (List<Object>) second);
        
        } else if (second instanceOf Set<Object>) {

            return compareWithList ( first, new List<Object> ( (Set<Object>) second ) );

        } else {

            return compareObjects ( first, second );

        }

	}

}
