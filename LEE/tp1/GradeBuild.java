public class GradeBuild {
    public static Grade fromString (String grade) throws UnknownGradeException {
	switch (grade) {
	    case "PU" : return Grade.PU;
	    case "MCU" : return Grade.MCU;
	    case "PRAG" : return Grade.PRAG;
	    case "BIATTS" : return Grade.BIATTS;
	    case "PUPH" : return Grade.PUPH;
	    case "MCUPH" : return Grade.MCUPH;
	    default : throw new UnknownGradeException();
	}
    }
}