﻿namespace Travel.Entities
{
	using System.Linq;
	using System.Collections.Generic;

	using Contracts;
	using Items.Contracts;

	public class Bag : IBag
	{
		private List<IItem> items;

		public Bag(IPassenger owner, IEnumerable<IItem> items)
		{
            this.Owner = owner;
            this.items = items.ToList();
		}

		public IPassenger Owner { get; }

		public IReadOnlyCollection<IItem> Items => this.items.AsReadOnly();
	}
}