syn keyword CocoaClass NSString NSArray NSSet NSDictionary NSNumber NSInteger NSDate
syn keyword UIKitClass UIView UITableView UITableViewCell UINavigationController UIViewController UIApplication UITableViewController UIColor UIToolbar UIBarButtonItem
syn keyword CGStruct CGRect CGFloat
syn keyword CGMethod CGRectMake
 
 
command -nargs=+ HiLink hi def link <args>

HiLink CocoaClass objcType
HiLink UIKitClass objcType
HiLink CGStruct Type
HiLink CGMethod Function

delcommand HiLink
 
