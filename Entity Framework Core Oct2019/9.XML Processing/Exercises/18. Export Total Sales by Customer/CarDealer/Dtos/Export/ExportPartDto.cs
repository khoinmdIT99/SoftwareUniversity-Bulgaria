﻿namespace CarDealer.Dtos.Export
{
    using System.Xml.Serialization;

    [XmlType("part")]
    public class ExportPartDto
    {
        [XmlAttribute(AttributeName = "name")]
        public string Name { get; set; }

        [XmlAttribute(AttributeName = "price")]
        public decimal Price { get; set; }
    }
}
