package action;

import com.opensymphony.xwork2.ActionSupport;
import daos.Admin;

import java.sql.ResultSet;

public class UpdateAction extends ActionSupport {

    private static final long serialVersionUID = -1905974197186620917L;
    private String uname = "", uemail = "", upass = "", udeg = "", uemailhidden = "";
    private String msg = "";
    ResultSet rs = null;
    Admin dao = new Admin();
    String submitType;

    @Override
    public String execute() throws Exception {
        try {
            if (submitType.equals("updatedata")) {
                rs = dao.fetchUserDetails(uemail.trim());
                if (rs != null) {
                    while (rs.next()) {
                        uname = rs.getString("UNAME");
                        uemail = rs.getString("UEMAIL");
                        upass = rs.getString("UPASS");
                        udeg = rs.getString("UDEG");
                    }
                }
            } else {
                int i = dao.updateUserDetails(uname, uemail, upass, udeg, uemailhidden);
                if (i > 0) {
                    msg = "Record Updated Successfuly";
                } else {
                    msg = "error";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "UPDATE";
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getUdeg() {
        return udeg;
    }

    public void setUdeg(String udeg) {
        this.udeg = udeg;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUemailhidden() {
        return uemailhidden;
    }

    public void setUemailhidden(String uemailhidden) {
        this.uemailhidden = uemailhidden;
    }

    public String getSubmitType() {
        return submitType;
    }

    public void setSubmitType(String submitType) {
        this.submitType = submitType;
    }
}