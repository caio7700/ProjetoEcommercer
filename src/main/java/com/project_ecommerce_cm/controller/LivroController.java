package com.project_ecommerce_cm.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.infra.FileSaver;
import com.project_ecommerce_cm.repository.AutorRepository;
import com.project_ecommerce_cm.repository.CategoriaRepository;
import com.project_ecommerce_cm.repository.EditoraRepository;
import com.project_ecommerce_cm.repository.LivroRepository;

@Controller
public class LivroController {

	@Autowired
	LivroRepository livroRepository;
	
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@Autowired
	EditoraRepository editoraRepository;
	
	@Autowired
	AutorRepository autorRepository;
	
	@Autowired
	FileSaver fileSaver;
	
	@GetMapping("/admin/cadastrarlivro")
	public ModelAndView form (Livro livro) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/formLivro");
		modelAndView.addObject("categorias", categoriaRepository.findByAtivoTrue());
		modelAndView.addObject("autores", autorRepository.findByAtivoTrue());
		modelAndView.addObject("editoras", editoraRepository.findByAtivoTrue());
		return modelAndView;
	}
	
	@InitBinder    /* Converts empty strings into null when a form is submitted */
	public void initBinder(WebDataBinder binder) {  
	    binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));  
	}
	
	@PostMapping("/admin/livro")
	public ModelAndView create(MultipartFile foto1, @Valid Livro livro, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cadastrarlivro");
		
		if(bindingResult.hasErrors()) {
			return form(livro);
		}
		
		if(!foto1.isEmpty()) {
			String path = fileSaver.write("imagens", foto1);
			livro.setFoto(path);
		}
		
		livroRepository.save(livro);

		redirectAttributes.addFlashAttribute("msgm", "Livro Cadastrado Com Sucesso");
		return modelAndView;
	}
	
	@GetMapping("/admin/listalivro")
	public ModelAndView listalivro() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/listaLivro");
		List<Livro> livros = livroRepository.findAll();
		modelAndView.addObject("listaLivro", livros);
		return modelAndView;
	}
	
	@SuppressWarnings("deprecation")
	@GetMapping("/admin/editarL/{id}")
	public ModelAndView editarLivro(@PathVariable("id") Integer id, Livro livro, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/editarLivro");
		livro = livroRepository.getById(id);
		modelAndView.addObject("livroEdit", livro);
		return modelAndView;
	}
	
	@PostMapping("/admin/editarLivro")
	public ModelAndView updateLivro(@Valid Livro livro,MultipartFile foto1 ,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/admin/listalivro");

		@SuppressWarnings("deprecation")
		Livro livro1 = livroRepository.getById(livro.getId());
		livro1.setTitulo(livro.getTitulo());
		livro1.setPaginas(livro.getPaginas());
		livro1.setPreco(livro.getPreco());
		livro1.setAutor(livro.getAutor());
		livro1.setEditora(livro.getEditora());
		livro1.setCategoria(livro.getCategoria());
		
		if(bindingResult.hasErrors()) {
			return editarLivro(livro1.getId(), livro1, redirectAttributes);
		}
		
		if (foto1 != null) {
			fileSaver.remove(livro1.getFoto());
			String path = fileSaver.write("imagens", foto1);
			livro1.setFoto(path);
		}

		livroRepository.save(livro1);

		redirectAttributes.addFlashAttribute("msg", "Livro editado(a) com sucesso");
		return modelAndView;
	}
	
	@GetMapping("/inativarLivro/{id}")
	public ModelAndView inativarLivro(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listalivro");
		Livro livro = livroRepository.findById(id).get();
		livro.setAtivo(false);
		livroRepository.save(livro);
		//editoraRepository.delete(livro);	
		redirectAttributes.addFlashAttribute("msg", "Livro Inativado Com Sucesso");
		return modelAndView;
	}
	
	@GetMapping("/ativarLivro/{id}")
	public ModelAndView ativarLivro(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listalivro");
		Livro livro = livroRepository.findById(id).get();
		livro.setAtivo(true);
		livroRepository.save(livro);
		//editoraRepository.delete(livro);	
		redirectAttributes.addFlashAttribute("msg", "Livro Ativado Com Sucesso");
		return modelAndView;
	}
	
}
