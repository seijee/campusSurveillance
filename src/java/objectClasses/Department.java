
package objectClasses;

import java.io.Serializable;

public class Department implements Serializable {
	private String depCode, title, HOD;

	public Department(String departmentCode , String title, String HOD) {
		this.depCode = departmentCode;
		this.title = title;
		this.HOD = HOD;
	}

	public Department() {
	}
	
	public String getHOD() {
		return HOD;
	}

	public void setHOD(String HOD) {
		this.HOD = HOD;
	}

	public String getDepCode() {
		return depCode;
	}

	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
