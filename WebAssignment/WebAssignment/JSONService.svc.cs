using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using WebAssignment.Models;

namespace WebAssignment
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class JSONService
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public void DoWork()
        {
            // Add your operation implementation here
            return;
        }

        [OperationContract]
        [WebInvoke(Method="GET", ResponseFormat=WebMessageFormat.Json, BodyStyle=WebMessageBodyStyle.Bare)]
        public List<TeamInfoDisplayJSON> GetTeamInfo()
        {
            List<TeamInfoDisplayJSON> listForTeamInfo = new List<TeamInfoDisplayJSON>();
            Context _db = new Context();


            List<LoginRegister> positions = _db.LoginS.ToList();
            List<TeamInfo> teamInfo = _db.TeamInfos.ToList();

            var join = positions.Join(teamInfo, (p) => p.UserID, (t) => t.UserID, (p, t) =>
                                new
                                {
                                    t.UserID,
                                    t.FirstName, 
                                    t.LastName, 
                                    p.UserPosition,
                                    t.Phone,
                                    t.Email
                                });
            //iterating trough anonymouse collection to get the list
            foreach (var item in join)
            {
                TeamInfoDisplayJSON displayObj = new TeamInfoDisplayJSON();
                displayObj.UserId = item.UserID;
                displayObj.FirstName = item.FirstName;
                displayObj.LastName = item.LastName;
                displayObj.Position = item.UserPosition;
                displayObj.Telephone = item.Phone;
                displayObj.Email = item.Email;

                listForTeamInfo.Add(displayObj);
            }

            return listForTeamInfo;
        }
        // Add more operations here and mark them with [OperationContract]
    }
}
