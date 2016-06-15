
/*
*  Warewolf - Once bitten, there's no going back
*  Copyright 2016 by Warewolf Ltd <alpha@warewolf.io>
*  Licensed under GNU Affero General Public License 3.0 or later. 
*  Some rights reserved.
*  Visit our website for more information <http://warewolf.io/>
*  AUTHORS <http://warewolf.io/authors.php> , CONTRIBUTORS <http://warewolf.io/contributors.php>
*  @license GNU Affero General Public License <http://www.gnu.org/licenses/agpl-3.0.html>
*/

using System;

// ReSharper disable once CheckNamespace
namespace Dev2.Studio.Core.Network
{
    public enum ServerState
    {
        Offline,
        Online
    }

    public class ServerStateEventArgs : EventArgs
    {
        public ServerStateEventArgs(ServerState state)
        {
            State = state;
        }

        public ServerState State { get; private set; }
    }
}
