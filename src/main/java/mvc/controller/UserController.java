package mvc.controller;


import mvc.model.Adress;
import mvc.model.Role;
import mvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import mvc.services.ServicesDao;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller

public class UserController {
    @Autowired
    private ServicesDao servicesDao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String start() {
        return "start";
    }

    @RequestMapping(value = "/enter", method = RequestMethod.GET)
    public String enter() {
        return "/enterAccount";
    }

    @RequestMapping(value = "/enter", method = RequestMethod.POST)
    public String goToEnterPage(Model model, @RequestParam("login") String login, @RequestParam("password") String password) {
        String value = "";
        if (servicesDao.showUser(login, password).getRole().getTitle().equals("Admin")) {
            model.addAttribute("user", servicesDao.findAll());
            value = "listUserForm";
        } else if (servicesDao.showUser(login, password).getRole().getTitle().equals("user")) {
            model.addAttribute("user", servicesDao.showUser(login, password));
            value = "listOne";
        }
        return value;
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.GET)
    public String create() {
        return "createUser";
    }

    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String addUser(Model model, @RequestParam("login") String login, @RequestParam("password") String password,
                          @RequestParam("age") int age, @RequestParam("name") String name, @RequestParam("description") String description,
                          @RequestParam("town") String town, @RequestParam("street") String street, @RequestParam("house") String house,
                          @RequestParam("role") String title) {
        String value;
        User user = new User();
        Adress adress = new Adress();
        Role role = new Role();
        user.setLogin(login);
        user.setPassword(password);
        user.setAge(age);
        user.setName(name);
        user.setDescription(description);
        adress.setTown(town);
        adress.setStreet(street);
        adress.setHouse(house);
        user.setAdress(adress);
        role.setTitle(title);
        role.addUsers(user);
        user.setRole(role);
        servicesDao.saveUser(user);
        model.addAttribute(user);
        value = "enterAccount";
        return value;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String del(){
        return "delete";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") int id) {
        servicesDao.delete(id);
        return "enterAccount";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String up(){
        return "update";
    }
    @RequestMapping(value = "/updateOne", method = RequestMethod.GET)
    public String upOne(){
        return "updateOne";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Model model, @RequestParam("id") int id, @RequestParam("login") String login, @RequestParam("password") String password,
                         @RequestParam("age") int age, @RequestParam("name") String name, @RequestParam("description") String description,
                         @RequestParam("town") String town, @RequestParam("street") String street, @RequestParam("house") String house,
                         @RequestParam("role") String title) {
        String value;
        User user = servicesDao.userId(id);
        user.setId(id);
        user.setLogin(login);
        user.setPassword(password);
        user.setAge(age);
        user.setName(name);
        user.setDescription(description);
        user.getAdress().setTown(town);
        user.getAdress().setStreet(street);
        user.getAdress().setHouse(house);
        user.getRole().setTitle(title);
        servicesDao.update(user);
        model.addAttribute(user);
        value = "enterAccount";
        return value;
    }
}


