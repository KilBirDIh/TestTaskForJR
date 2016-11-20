package org.kilbirdih.controller;


import org.kilbirdih.model.User;
import org.kilbirdih.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class SpringController
{
    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getUsers(Model model)
    {
        List users = userService.getAllUsers();

        model.addAttribute("users", users);

        return "userspage";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String getAddUser(Model model)
    {
        model.addAttribute("userAttribute", new User());

        return "addpage";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("userAttribute") User user)
    {
        userService.createUser(user);

        return "addedpage";
    }

    @RequestMapping(value = "/users/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Long id,
                         Model model) {

        // Call PersonService to do the actual deleting
        userService.deleteUser(id);

        // Add id reference to Model
        model.addAttribute("id", id);

        // This will resolve to /WEB-INF/jsp/deletedpage.jsp
        return "deletedpage";
    }

    /**
     * Retrieves the edit page
     *
     * @return the name of the JSP page
     */
    @RequestMapping(value = "/users/edit", method = RequestMethod.GET)
    public String getUpdate(@RequestParam(value="id", required=true) Long id,
                          Model model) {

        // Retrieve existing Person and add to org.kilbirdih.model
        // This is the formBackingOBject
        model.addAttribute("userAttribute", userService.getUser(id));

        // This will resolve to /WEB-INF/jsp/editpage.jsp
        return "editpage";
    }

    /**
     * Edits an existing person by delegating the processing to PersonService.
     * Displays a confirmation JSP page
     *
     * @return  the name of the JSP page
     */
    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public String saveUpdate(@ModelAttribute("userAttribute") User user,
                           @RequestParam(value="id", required=true) Long id,
                           Model model) {


        // The "personAttribute" org.kilbirdih.model has been passed to the org.kilbirdih.controller from the JSP
        // We use the name "personAttribute" because the JSP uses that name

        // We manually assign the id because we disabled it in the JSP page
        // When a field is disabled it will not be included in the ModelAttribute
        user.setId(id);

        // Delegate to PersonService for editing
        userService.updateUser(user);

        // Add id reference to Model
        model.addAttribute("id", id);

        // This will resolve to /WEB-INF/jsp/editedpage.jsp
        return "editedpage";
    }
}
