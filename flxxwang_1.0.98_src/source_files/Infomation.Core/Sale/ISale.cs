﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public interface ISale:IInfo
    {
        string District
        {
            get;
            set;
        }
        int Price
        {
            get;
            set;
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        string Content
        {
            get;
            set;
        }
        /// <summary>
        /// QQ或MSN
        /// </summary>
        string QQOrMSN
        {
            get;
            set;
        }
    }
}
