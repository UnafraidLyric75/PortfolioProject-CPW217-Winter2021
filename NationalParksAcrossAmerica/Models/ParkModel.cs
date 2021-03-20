using System;
using System.ComponentModel.DataAnnotations;

namespace NationalParksAcrossAmerica.Models
{
    public class ParkModel
    {
        [Key]
        public int ParkId { get; set; }

        /// <summary>
        /// Name of the park ex. YellowStone National Park, 
        /// Redwood National Forest
        /// Dashpoint State Park
        /// </summary>
        public string ParkName { get; set; }

        /// <summary>
        /// The park type is if it is a momument, State, Natioanl, Forest, etc.
        /// </summary>
        public string ParkType { get; set; }

        /// <summary>
        /// Which country the park is located in
        /// </summary>
        public string ParkNation { get; set; }
    }
}