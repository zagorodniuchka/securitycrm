﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SecurityCRM.ApiContracts.DTO.User
{
    public class RoleDTO : DTOBase
    {
        public string Name { get; set; }
        public long Permission { get; set; }
    }
}
