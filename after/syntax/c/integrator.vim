" Vim syntax file
" Language:	C++ special highlighting for Acculogic Integrator classes and methods
" Maintainer:	Reza Jelveh
" Last Change:	2008 November 24

syn keyword cppIntegrator	frc_create_window frc_destroy_window uim_end_edit_object
syn keyword cppIntegrator frc_refresh_header_name frc_refresh_header_comment
syn keyword cppIntegrator frc_refresh_header_state frc_add_predef_to_toolbar
syn keyword cppIntegrator frc_tol_query
syn keyword cppIntegrator svc_avail svc_reset_connect svc_contact_tp svc_sf_connect
syn keyword cppIntegrator sc_tpn_get_test_points 
syn keyword cppIntegrator sc_tpn_addref sc_tpn_set_max_test_point_count sc_tpn_set_owner
syn keyword cppIntegrator sc_tpn_release
syn keyword cppIntegrator sbc_refresh sbc_entryfield_comp
syn keyword cppIntegrator dts_discharge dts_2_wire_meas_v dts_34_wire_meas_v
syn keyword cppIntegrator cls_create_class

syn keyword cppIntegratorType	IScRte 
syn keyword cppIntegratorType cls_meas_result_type cls_prduce_type cls_produce_method
syn keyword cppIntegratorType cls_destroy_method cls_end_edit_method cls_call_method
syn keyword cppIntegratorType cls_learn_method cls_notify_method cls_get_hw_res_method
syn keyword cppIntegratorType cls_execute_method cls_create_type cls_create_type_ex
syn keyword cppIntegratorType cls_edit_method cls_handle cls_query_size_method 
syn keyword cppIntegratorType cls_query_method cls_set_method cls_comp_create_type
syn keyword cppIntegratorType cls_result_desc_create_type cls_produce_type
syn keyword cppIntegratorType	errort sbool ulong ushort handle zstring

syn keyword cppIntegratorConst ITR_ERR_NO_ERROR
syn keyword cppIntegratorConst DOUBLE_TYPE ZSTRING_TYPE TPN_TYPE ULONG_TYPE 
syn keyword cppIntegratorConst BCONSTANT_TYPE OBJECT_TYPE
syn keyword cppIntegratorConst CLS_COMP_ATTR_EDIT CLS_COMP_ATTR_ENG 
syn keyword cppIntegratorConst CLS_COMP_ATTR_COMMENT CLS_COMP_ATTR_OBJECT_ID 
syn keyword cppIntegratorConst CLS_COMP_ATTR_OBJSTATE CLS_COMP_ATTR_NOT_SAVEABLE
syn keyword cppIntegratorConst CLS_COMP_ATTR_FLC_INDEX CLS_NO_COMP_IDX
syn keyword cppIntegratorConst CLS_COMP_ATTR_NO_PRS_NAME CLS_RESULT_ATTR_ENG

" Default highlighting
command -nargs=+ HiLink hi def link <args>
HiLink cppIntegrator				Identifier
HiLink cppIntegratorType          Type
HiLink cppIntegratorConst     Constant
delcommand HiLink

