﻿using Application;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Core
{
    public class FakeApiActor : IApplicationActor
    {
        public int Id => 1;

        public string Identity => "Test api user";

        public IEnumerable<int> AllowedUseCases => new List<int> { 1};
    }

    public class AdminFakeApiActor : IApplicationActor
    {
        public int Id => 2;

        public string Identity => "Fake admin";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1,1000);
    }
}
