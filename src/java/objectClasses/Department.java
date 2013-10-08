
package objectClasses;

import java.io.Serializable;

public class Department implements Serializable {
	private String departmentCode, title, HOD;

	public Department(String departmentCode, String title, String HOD) {
		this.departmentCode = departmentCode;
		this.title = title;
		this.HOD = HOD;
	}

	public String getHOD() {
		return HOD;
	}

	public void setHOD(String HOD) {
		this.HOD = HOD;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
