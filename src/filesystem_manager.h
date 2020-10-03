#ifndef HEADER_FILESYSTEM_MANAGER
#define HEADER_FILESYSTEM_MANAGER

#include <string>
#include "Travel_types.h"

filesystem_file_info add_virtual_file(file_data_func data_func,
                                      void *private_data,
                                      size_t file_size,
                                      unsigned int unit_size = 1,
                                      const char *name = NULL);
const std::string& get_virtual_file_name(inode_type inode);
inode_type get_virtual_file_inode(const std::string name);
filesystem_file_data& get_virtual_file(const std::string name);
filesystem_file_data& get_virtual_file(inode_type inode);
bool has_virtual_file(const std::string name);
bool has_virtual_file(inode_type inode);
bool remove_virtual_file(const std::string name);
typename std::map<const inode_type,const std::string>::iterator virtual_file_begin();
typename std::map<const inode_type,const std::string>::iterator virtual_file_end();


bool is_filesystem_running();
#endif