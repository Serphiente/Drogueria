<?php namespace Skecskes\Calendar\Facades;

use Illuminate\Support\Facades\Facade;

class Calendar extends Facade {

    /**
     * Get the registered name of the component.
     *
     * @return string
     */
	protected static function getFacadeAccessor() {
		return 'Skecskes\Calendar\Calendar';
	}

}
