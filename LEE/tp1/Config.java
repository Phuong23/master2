public class Config {

    // Client commands
    public static final String 
	AGE = "ageOf",
	LIST_ACTIONS = "help",
	EXIT = "exit",
	MOY_AGE = "moyAge",
	MOY_AGE_BETWEEN = "moyAgeBetween",
	MOY_AGE_GRADE = "moyAgeGrade",
	ADD = "add",
	LIST = "list",
	MOD = "mod",
	DEL = "del",
	GET = "get",
	PREMIER = "premier";

    public static final String
	HELP_CONTENT = " help\r\n exit\r\n ageOf <nom>\r\n moyAge\r\n moyAgeBetween <min> <max>\r\n moyAgeGrade <grade>\r\n add <nom>:<salaire>:<age>:<grade>\r\n list\r\n mod <currentName>:<name>:<salaire>:<age>:<grade>\r\n del <nom>\r\n get <nom>\r\n premier <entier>";
}