package ar.com.educacionit.web.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.educacionit.domain.Menu;
import ar.com.educacionit.services.exceptions.ServiceException;
import ar.com.educacionit.services.impl.MenuServiceImpl;

@WebServlet("/controller/MenuController")
public class MenuController extends HttpServlet {

	private static final long serialVersionUID = -6309478882566906917L;

		//GET
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//> String
			
		MenuServiceImpl ar = new MenuServiceImpl();
		try {
			List<Menu> list = ar.findAll();	
			List<Menu> menuEstructurado = buildMenu(list);	
			request.setAttribute("menus", menuEstructurado);
			//OK
			getServletContext().getRequestDispatcher("/menu.jsp").forward(request, response);
		} catch (ServiceException e) {
				//FAIL
			getServletContext().getRequestDispatcher("/registroFail.jsp").forward(request, response);
		}
		
			
	}
	private static List<Menu> buildMenu(List<Menu> listMenu){
		
		Map<Long, Menu> mapRoot = new HashMap();
		List<Menu> menuFiltrado = new ArrayList();
		
		for(Menu m: listMenu) {
			if(m.isRoot()) {
				mapRoot.put(m.getId(), m);
			}
		}
		
		for(Menu m : listMenu) {
			if(!m.isRoot()) {
				if(m.getIdMenuPadre()!=null && m.getId() !=0){
					Menu menuRoot = mapRoot.get(m.getIdMenuPadre());
					if(menuRoot != null) {
						menuRoot.getSubMenu().add(m);
					} else {
						addToParent(listMenu, m);
					}
				}
			}
		}
		
		List<Menu> menuOrdenado = new ArrayList<Menu>();
		menuOrdenado.addAll(mapRoot.values());
		return menuOrdenado;
		
	}
	
	private static void addToParent(List<Menu> listMenu, Menu m) {
		boolean exists = false;
		for(int i=0; !exists && i<listMenu.size(); i++) {
			Menu aux = listMenu.get(i);
			if(m.getIdMenuPadre().equals(aux.getId())){
				aux.getSubMenu().add(m);
				exists = true;
			}
		}
	}
	
}
