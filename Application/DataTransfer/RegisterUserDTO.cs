﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class RegisterUserDto
    {
      

        public int Rid { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
    }
}
