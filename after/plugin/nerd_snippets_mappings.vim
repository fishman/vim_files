function! s:SetupHTMLMaps(ft)
    call NERDSnippet(a:ft, 'divcf', "<div class=\"aligned content-frame\">\<cr><div class=\"title\"><+title+></div>\<CR><+body+>\<CR></div>")
    call NERDSnippet(a:ft, 'p', "<p><++></p>")
    call NERDSnippet(a:ft, '<label', "<label for=\"<+id+>\"><+label_text+></label>")

    call NERDSnippet(a:ft, '<table', "<table class=\"<++>\">\<CR><++>\<CR></table>")
    call NERDSnippet(a:ft, '<table2', "<table cellspacing=\"0\" cellpadding=\"0\"<++>>\<CR><++>\<CR></table>")
    call NERDSnippet(a:ft, '<td', "<td><++></td>")
    call NERDSnippet(a:ft, '<tr', "<tr>\<CR><++>\<CR></tr>")
    call NERDSnippet(a:ft, '<th', "<th><++></th>")
    call NERDSnippet(a:ft, '<thead', "<thead>\<CR><++>\<CR></thead>")
    call NERDSnippet(a:ft, '<tbody', "<tbody>\<CR><++>\<CR></tbody>")

    call NERDSnippet(a:ft, 'span', "<span<++>><++></span>")
    call NERDSnippet(a:ft, 'div', "<div<++>>\<CR><++>\<CR></div>")
    call NERDSnippet(a:ft, 'id', "id=\"<++>\"")
    call NERDSnippet(a:ft, 'pcf', "<p>\<CR>  <label for=\"<+id+>\"><++></label>\<CR><++>\<CR></p>")
    call NERDSnippet(a:ft, 'img', "<img src=\"<++>\"<++> />")
    call NERDSnippet(a:ft, 'h1', "<h1<++>><++></h1>")
    call NERDSnippet(a:ft, 'h2', "<h2<++>><++></h2>")
    call NERDSnippet(a:ft, 'h3', "<h3<++>><++></h3>")
    call NERDSnippet(a:ft, 'li', "<li><++></li>")
    call NERDSnippet(a:ft, 'b', "<b><++></b>")
    call NERDSnippet(a:ft, 'strong', "<strong><++></strong>")

    call NERDSnippet(a:ft, 'title', "<title><++></title>")
    call NERDSnippet(a:ft, 'select', "<select name=\"<++>\"<++>><++></select>")
    call NERDSnippet(a:ft, 'script', "<script type=\"text/javascript\">\<CR>//<![CDATA[\<cr><++>\<CR>//]]>\<CR></script>")
    call NERDSnippet(a:ft, 'style', "<style type=\"text/css\">\<CR><++>\<CR></style>")


    call NERDSnippet(a:ft, 'href', '<a href="<++>"><++></a>')
    call NERDSnippet(a:ft, 'link', '<link rel="stylesheet" type="text/css" href="<++>" />')

endfunction


"html mappings
call s:SetupHTMLMaps('html')

"ruby mappings
call NERDSnippet('ruby', 'vpo', "validates_presence_of <++>")
call NERDSnippet('ruby', 'vno', "validates_numericality_of <++>")
call NERDSnippet('ruby', 'vuo', "validates_uniqueness_of <++>")
call NERDSnippet('ruby', 'bvoc', "before_validation_on_create <++>")
call NERDSnippet('ruby', 'bv', "before_validation <++>")

call NERDSnippet('ruby', 'RDL', "RAILS_DEFAULT_LOGGER.debug <++>")

call NERDSnippet('ruby', 'rmc', "remove_column :<+table+>, :<+column+>")
call NERDSnippet('ruby', 'rnc', "rename_column :<+table+>, :<+old+>, :<+new+>")
call NERDSnippet('ruby', 'ac', "add_column :<+table+>, :<+column+>, :<+type+>")
call NERDSnippet('ruby', 'ct', "create_table :<+table_name+> do |t|\<CR>t.column :<+name+>, :<+type+>\<CR>end")

call NERDSnippet('ruby', 'chm', "check_has_many :<+accessor+>, :<+fixture+>, <+klass+>, <+number+>")
call NERDSnippet('ruby', 'cbt', "check_belongs_to :<+accessor+>, :<+fixture+>, :<+expected_fixture+>")
call NERDSnippet('ruby', 'cho', "check_has_one :<+accessor+>, :<+fixture+>, :<+expected_fixture+>")

call NERDSnippet('ruby', 'def', "def <+function_name+>\<CR><++>\<CR>end\<CR>")
call NERDSnippet('ruby', 'class', "class <++>\<CR><++>\<CR>end\<CR>")
call NERDSnippet('ruby', 'map', "map {|<+var+>| <+body+>}")
call NERDSnippet('ruby', 'mapb', "map do |<+var+>|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'select', "select {|<+var+>| <+body+>}")
call NERDSnippet('ruby', 'selectb', "select do |<+var+>|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'sort', "sort {|<+var1+>,<+var2+>| <+body+>}")
call NERDSnippet('ruby', 'sortb', "sort do |<+var1+>,<+var2+>|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'each', "each {|<+var+>| <+body+>}")
call NERDSnippet('ruby', 'eachb', "each do |<+var+>|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'each_with_index', "each_with_index {|<+var+>,i| <++>}")
call NERDSnippet('ruby', 'each_with_indexb', "each_with_index do |<+var+>,i|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'inject', "inject {|<+total+>,<+next_var+>| <+body+>}")
call NERDSnippet('ruby', 'injectb', "inject do |<+total+>,<+next_var+>|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'detect', "detect {|<+var+>| <+body+>}")
call NERDSnippet('ruby', 'detectb', "detect do |<+var+>|\<CR><+body+>\<CR>end\<CR>")
call NERDSnippet('ruby', 'do', "do\<CR><++>\<CR>end\<CR>")

"eruby mappings
call NERDSnippet('eruby', 'rp', "<%= render :partial => \"<+file+>\"<++> %>")
call NERDSnippet('eruby', 'rt', "<%= render :template => \"<+file+>\"<++> %>")
call NERDSnippet('eruby', 'rf', "<%= render :file => \"<+file+>\"<++> %>")
call NERDSnippet('eruby', '<%', "<% <++> -%>")
call NERDSnippet('eruby', '<%=', "<%= <++> %>")
call NERDSnippet('eruby', '<%=h', "<%=h <++> %>")
call NERDSnippet('eruby', 'cs', "<%= collection_select <+object+>, <+method+>, <+collection+>, <+value_method+>, <+text_method+>, <+[options]+>, <+[html_options]+> %>")
call NERDSnippet('eruby', 'ofcfs', "<%= options_from_collection_for_select <+collection+>, <+value_method+>, <+text_method+>, <+[selected_value]+> %>")
call NERDSnippet('eruby', 'sslt', '<%= stylesheet_link_tag "<++>" %>')
call NERDSnippet('eruby', 'jsit', '<%= javascript_include_tag "<++>" %>')
call NERDSnippet('eruby', 'it', '<%= image_tag "<++>" %>')
call NERDSnippet('eruby', 'lt', '<%= link_to <++>, <+dest+> %>')
call s:SetupHTMLMaps('eruby')

" cake mappings
call NERDSnippet('php', 'element', "<?php echo $this->element('<++>'); ?>")
call NERDSnippet('php', 'formcreate', "<?php echo $form->create('<+User+>', array('action' => '<++>')); ?>")
call NERDSnippet('php', 'formend', "<?php echo $form->end(); ?>")
call NERDSnippet('php', 'forminput', "<?php echo $form->input('<+email+>', array('div'=> null, 'label' => false<+, 'type' => ''+>)); ?>")
call NERDSnippet('php', 'javascript', "<?php echo $javascript->link('<++>'); ?>")

function! s:SetupCMaps(ft)
  call NERDSnippet(a:ft, 'for', "for(<+size_t i = 0+>; <+i < count+> ; ++i)\<CR>{\<CR><++>\<CR>}")
  call NERDSnippet(a:ft, 'inc', "#include \"<++>\"")
  call NERDSnippet(a:ft, 'Inc', "#include <<++>>")
  call NERDSnippet(a:ft, 'if', "if(<++>){<++>")
  call NERDSnippet(a:ft, 'do', "do {\<CR><++>\<CR>} while(<++>)")
  call NERDSnippet(a:ft, 'printf', "printf(\"<++>\\n\",<++>);")
  call NERDSnippet(a:ft, 'fprintf', "fprintf(<+stderr+>, \"<++>\\n\",<++>);")
endfunction

function! s:SetupCPPMaps(ft)
  call NERDSnippet(a:ft, 'vector', "std::vector<<++>> v<++>;")
  call NERDSnippet(a:ft, 'map', "std::map<<++>, <++>> map<++>;")
  call NERDSnippet(a:ft, 'class', "class <+Class+>{\<CR>public:\<CR><++>\<CR>};")
endfunction

function! s:SetupObjCMaps(ft)
  call NERDSnippet(a:ft, 'ibo', "IBOutlet <+name+> *<++>")
  call NERDSnippet(a:ft, 'iba', "- (IBAction)<+method+>:(id)sender<++>")
  call NERDSnippet(a:ft, 'm', "- (<++>)<+method+>")
  call NERDSnippet(a:ft, 'Imp', "#import <Cocoa/Cocoa.h>")
  call NERDSnippet(a:ft, 'imp', "#import \"<++>\"")
  call NERDSnippet(a:ft, 'array', "NSMutableArray *<+array+> = [NSMutableArray array];")
endfunction

function! s:SetupVSMaps(ft)
  call NERDSnippet(a:ft, 'messagebox', "MessageBox(NULL, \"<+Caption+>\", \"<+Text+>\", <+MB_OK+>);")
endfunction

"c mappings
call s:SetupCMaps('c')

"cpp mappings
call s:SetupCMaps('cpp')
call s:SetupCPPMaps('cpp')

"objc mappings
call s:SetupCMaps('objc')
call s:SetupObjCMaps('objc')

"objcpp mappings
call s:SetupCMaps('objcpp')
call s:SetupCPPMaps('objcpp')
call s:SetupObjCMaps('objcpp')
