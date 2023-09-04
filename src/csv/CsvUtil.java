package csv;

public class CsvUtil {
	private CsvUtil() {}
	
	public static String[] cleanEmptySpaceAndDashesFrom(String[] words) {
		String[] cleanWords = new String[words.length];
		
		for(int i=0;i<words.length;i++) {
			
			String[] splitedWord = words[i].split(" |-");
			StringBuilder buildSplitedWord = new StringBuilder();
			
			for(String word : splitedWord) {
				buildSplitedWord.append(word);
			}
			
			cleanWords[i]=buildSplitedWord.toString();
		}
		
		return cleanWords;
		
		
	}
	
}














































