package csv;

public class HeaderRangesUtil {
	
	public static final HeaderRanges begginingHeaderRange = new HeaderRanges(0, 2);
	public static final HeaderRanges macronutrientsHeaderRange = new HeaderRanges(2, 12);
	public static final HeaderRanges mineralsHeaderRange = new HeaderRanges(12, 27);
	public static final HeaderRanges vitaminsHeaderRange = new HeaderRanges(27, 56);
	public static final HeaderRanges otherNutritionRange = new HeaderRanges(56, 62);
	public static final HeaderRanges carbsSugarsRange = new HeaderRanges(62, 74);
	public static final HeaderRanges fatsRange = new HeaderRanges(74, 137);
	public static final HeaderRanges aminoAcidsRange = new HeaderRanges(137, -1);
	
	private HeaderRangesUtil () {}
}
