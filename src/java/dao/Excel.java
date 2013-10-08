
package dao;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import objectClasses.people.Student;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFRow;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class Excel {
	private static String toTitleCase(String s) {
    //s = s.toLowerCase();
	final String ACTIONABLE_DELIMITERS = " '-/"; // these cause the character following
                                                 // to be capitalized

    StringBuilder sb = new StringBuilder();
    boolean capNext = true;

    for (char c : s.toCharArray()) {
        c = (capNext)
                ? Character.toUpperCase(c)
                : Character.toLowerCase(c);
        sb.append(c);
        capNext = (ACTIONABLE_DELIMITERS.indexOf((int) c) >= 0); // explicit cast not needed
    }
    return sb.toString();
	}
    public static List<Student> ImportStudents(File file ) {
        
		List<Student> set = new ArrayList<Student>();
		try {
            InputStream input = new BufferedInputStream(new FileInputStream(file));			
            POIFSFileSystem fs = new POIFSFileSystem( input );
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);
            
            Iterator rows = sheet.rowIterator();
			HSSFRow row;
			Iterator cells;
			HSSFCell cell;
			
			Map<String, Integer> values = new HashMap<String, Integer>();
			
			boolean indexed = false;
			
			
			//field detection started
			while (!indexed && rows.hasNext()){
				row = (HSSFRow) rows.next();
				cells = row.cellIterator();
			while (cells.hasNext()){
				cell = (HSSFCell) cells.next();
				if(HSSFCell.CELL_TYPE_STRING==cell.getCellType()){
					String field = cell.getStringCellValue();
					field = field.toUpperCase();
					int index = cell.getColumnIndex();
					System.out.println(field + " >>>>" + index);
					if (field.contains("ENROL")){
						values.put("id", index);
						indexed = true;
					}else if (field.contains("NAME") || field.contains("FATHER") || field.contains("MOTHER") ){
						if (field.contains("FATHER")){
							values.put("father", index);
						}else if (field.contains("MOTHER")){
							values.put("mother", index);
						}else{
							values.put("name", index);
						}
					}else if (field.contains("GENDER")){
						values.put("gender", index);
					}else if (field.contains("DOB")){
						values.put("dob", index);
					}else if (field.contains("MAIL")){
						values.put("email", index);
					}else if (field.contains("MOB")){
						values.put("mobile", index);
					}else if (field.contains("ADDRESS")){
						if (field.contains("RESID")){
							values.put("res_address", index);
						}else{
							values.put("per_address", index);
						}
					}else if (field.contains("CAT")){
						values.put("category", index);
					}else if (field.contains("BRANCH")){
						values.put("branch", index);
					}else if (field.contains("BATCH")){
						values.put("batch", index);
					}else if (field.contains("SEM")){
						values.put("semester", index);
					}
				}
			}
			}
			//fields detected
			
			//data retrieval started
			
            while( rows.hasNext() ) {
                row = (HSSFRow) rows.next();
				//if (row.getCell(0).getCellType()==HSSFCell.CELL_TYPE_BLANK) continue;
                String id,name,father,Paddress, Raddress, gender, email,branch,mob,category,
						mother;
				int semester;
				Calendar dob = Calendar.getInstance();
				if (row.getCell(values.get("id")).getCellType() == HSSFCell.CELL_TYPE_BLANK
					|| 	row.getCell(values.get("name")).getCellType() == HSSFCell.CELL_TYPE_BLANK
					) continue;
				id = row.getCell(values.get("id")).getStringCellValue();
				Student p = (Student)dao.ConPerson.getPerson(id);
				if (p==null) {
					p = new Student();
					p.setPassword("aaa");
				}
						p.setId(id);
						name = row.getCell(values.get("name")).getStringCellValue();
						name = toTitleCase(name);
						p.setName(name);
				if (values.containsKey("father")){	
					father = row.getCell(values.get("father")).getStringCellValue();
					p.setFather_name(father);
				}if (values.containsKey("mother")){	
					mother = row.getCell(values.get("mother")).getStringCellValue();
					p.setMother_name(mother);
				}if (values.containsKey("per_address")){
					Paddress = row.getCell(values.get("per_address")).getStringCellValue();
					p.setP_address(Paddress);
				}if (values.containsKey("res_address")){
					Raddress = row.getCell(values.get("res_address")).getStringCellValue();
					p.setR_address(Raddress);
				}if (values.containsKey("gender")){
					gender = row.getCell(values.get("gender")).getStringCellValue();
					p.setGender(gender);
				}if (values.containsKey("email")){
					email = row.getCell(values.get("email")).getStringCellValue();
					p.setEmail(email);
				}if (values.containsKey("branch")){
					branch = row.getCell(values.get("branch")).getStringCellValue();
					p.setBranch(branch);
				}if (values.containsKey("mobile")){
					double m = row.getCell(values.get("mobile")).getNumericCellValue();
					long mobileNo = (long)m;
					mob = Long.toString(mobileNo);
					p.setMobile(mob);
				}if (values.containsKey("category")){
					category = row.getCell(values.get("category")).getStringCellValue();
					p.setCategory(category);
				}if (values.containsKey("dob")){
					dob.setTime(row.getCell(values.get("dob")).getDateCellValue());
					p.setDOB(dob);
				}if (values.containsKey("semester")){
					semester = (int)row.getCell(values.get("semester")).getNumericCellValue();
					p.setSemester(semester);
				}
				
				if (!"".equals(id) && !"".equals(name)) {
					System.out.println(p.getId()+" "+p.getName());
					set.add(p);
					//controllers.ConStudent.addNewStudent(p);
				}	
			}	
        } catch ( IOException ex ) {
            ex.printStackTrace();
        }finally{
			if (set.isEmpty() || set==null){
				return null;
			}
			return set;
		}
    }
    /*NA*/public static void ImportPunctuality (File file){
		//import punctuality of students of various concrete groups
	}
}