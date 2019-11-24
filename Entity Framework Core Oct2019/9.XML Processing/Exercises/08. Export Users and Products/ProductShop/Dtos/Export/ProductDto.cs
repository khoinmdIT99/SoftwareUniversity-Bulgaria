﻿namespace ProductShop.Dtos.Export
{
    using System.Xml.Serialization;

    public class ProductDto
    {
        [XmlElement(ElementName = "count")]
        public int Count { get; set; }

        [XmlArray(ElementName = "products")]
        public SoldProductDto[] Products { get; set; }
    }
}
